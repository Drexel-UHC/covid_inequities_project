bchc_data_updater = function(){
  
  ## Set up
  rm(list = ls())
  dir_local = "C:/Users/ranli/Desktop/Git local/BCHC COVID-19 Data/Data/"
  dir_cities_HR = paste0(dir_local,"City Code HR/r_code/")
  
  
  ## 1. Download  City Data ----  
  print("Step 1: Process Data")
  setwd(dir_cities_HR)
  if(  (format(Sys.time(),"%H")>=20) ) {
    source("../../code_data_city_HR.R")
  }
  
  ## 2. Process Data  ----
  {
    print("Step 2: Clean Data")
    setwd(dir_local)
    rm(list = ls())
    source("code_util.R", local = T)
    source("code_data_county.R", local = T)
    source("code_data_city.R", local = T)
    source("code_outcomes_city.R", local = T)
    source("code_ineq_zcta.R", local = T)
    source("code_ineq_city.R", local = T)
  }
  
  
  ## 3. Compile Bundle----
  rm(list = ls())
  load("clean_outcomes_city_optimized.rdata")
  load("clean_ineq_zcta.rdata")
  load("clean_ineq_city.rdata")
  
  ## 4. Save to Bundle   -----
  if (str_detect(getwd(),"Development")){
    save(list = ls(), file = "../App (Development)/bchc_cleaned_bundle.rdata")
    print("END: Save to Dev")
    
  } else{
    save(list = ls(), file = "../Clean/bchc_cleaned_bundle.rdata")
    source("code_data_outputs.R")
    
    
    ## 5. Push to Github -----
    rm(list = ls())
    if(  (format(Sys.time(),"%H")>=20)&
         (file.size("../Clean/bchc_cleaned_bundle.rdata")<970000)) {
      source("code_util.R", local = T)
      git2r::config(user.name = "rl627",user.email = "rl627@drexel.edu")
      git2r::config()
      gitstatus()
      gitadd()
      gitcommit()
      gitpush()
    }
    
    ## 6. Send Email -----
    {
      library(tableHTML)
      library(tidyverse)
      ## Load City Update Status and make tables
      load("../Clean/data_update_status.rdata")
      error_rows = df_city_update_status %>%
        mutate(n = row_number()) %>%
        filter(str_detect(Status, "Error")) %>%
        pull(n)
      html_table_tmp = df_city_update_status  %>%
        select(City,Source, Status, `Access Date`) %>% 
        tableHTML(rownames = F,
                  widths = c(150,150,150,150)) %>%
        add_css_row(css = list('color', 'red'), rows =error_rows+1)
      ## Write Email
      subject_tmp = ifelse(any(str_detect(df_city_update_status$Status,"Error")),
                           paste0("BCHC COVID Data Update ",
                                  Sys.Date() %>% format("%b %d, %Y"),
                                  "; Error in pipeline"),
                           paste0("BCHC COVID Data Update ",
                                  Sys.Date() %>% format("%b %d, %Y"))
      )
      body_tmp  = ifelse(any(str_detect(df_city_update_status$Status,"Error")),
                         str_c(
                           "Hi BCHC COVID-19 Data Platform Team,<br/><br/>",
                           "There was an error in the daily update process which scheduled at ",
                           Sys.time() %>% format("%I:%M %p %b %d, %Y."),
                           " The data team has been informed of this error.  Please see the table below for details.<br/><br/>",
                           html_table_tmp,
                           "<br/>The data team has been informed of this error. Other than the error noted above, county level Proxy data and all Cities with 'Update Okay' Status have been successfully updated at ",
                           Sys.time() %>% format("%I:%M %p %b %d, %Y."),
                           "<br/><br/>Thanks,<br/>BCHC COVID-19 Data Platform Team"
                         ),
                         str_c(
                           "Hi BCHC COVID-19 Data Platform Team member,<br/><br/>",
                           "This is a weekly automated email to keep track of our data updates.
                       Please see the table below for details about the data update for ",
                       Sys.time() %>% format("%I:%M %p %b %d, %Y."),
                       "<br/><br/>",
                       html_table_tmp,
                       "<br/><br/>Thanks,<br/>BCHC COVID-19 Data Platform Team"
                         )
      )
      ## Send email (Daily to self and Weekly to group)
      library (RDCOMClient)
      library(tidyverse)
      Outlook <- COMCreate("Outlook.Application")
      Email = Outlook$CreateItem(0)
      Email[["to"]] = ifelse(  ((format(Sys.Date(),"%a")%in%c("Thr"))&
                                  (format(Sys.time(),"%H")>=22)&
                                  (!str_detect(getwd(),"Development"))),
                               "rl627@drexel.edu", #;ub45@drexel.edu;emm387@drexel.edu;her43@drexel.edu;
                               "rl627@drexel.edu") 
      Email[["cc"]] = ""
      Email[["bcc"]] = ""
      Email[["subject"]] = subject_tmp
      Email[["htmlbody"]] = body_tmp
      Email$Send()
      rm(Outlook, Email)
      
    }
    
    print("END: Save to Production")
    
    
  }
  
  
}

bchc_data_updater()
