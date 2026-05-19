/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/



create or ALTER   procedure [bronze].[load_bronze] as
begin
declare @start_time datetime , @end_time datetime,@batch_start_time datetime,@batch_end_time datetime
begin try
set @batch_start_time = getdate()
 print '===============================';
 print 'loading bronze layer'
 print '===============================';
 
 print '=============================';
 print 'loading crm tables'
 print '===============================';
 set @start_time = getdate()
 print 'truncate crm cust info table';
truncate table bronze.crm_cust_info
print'inserting data into crm cust info';
bulk insert bronze.crm_cust_info from
'C:\Users\DELL 5510\Downloads\SQL\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
with ( firstrow = 2,
       fieldterminator = ',',
       tablock);
    set @end_time = getdate()
  
  print 'local duration is ' + cast(datediff(second,@start_time,@end_time) as nvarchar ) + ' secound' ;    
  set @start_time = getdate()
print 'truncate table prd info';
truncate table bronze.crm_prd_info
print'insert table prd info ';
bulk insert bronze.crm_prd_info from
'C:\Users\DELL 5510\Downloads\SQL\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
with ( firstrow = 2,
       fieldterminator = ',',
       tablock);
      set @end_time = getdate()   
      print 'local duration is ' + cast(datediff(second,@start_time,@end_time) as nvarchar ) + ' secound' ;     set @start_time = getdate()
  set @start_time = getdate()
print 'truncate table sales detalis';
truncate table bronze.crm_sales_details
print'insert table sales detalis ';
bulk insert bronze.crm_sales_details from
'C:\Users\DELL 5510\Downloads\SQL\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
with ( firstrow = 2,
       fieldterminator = ',',
       tablock);
         set @end_time = getdate()  
         print 'local duration is ' + cast(datediff(second,@start_time,@end_time) as nvarchar ) + ' secound' ;    
         set @start_time = getdate()
  set @start_time = getdate()

print 'truncate table cust az12 ';
truncate table bronze.erp_cust_az12
print 'insert table cust az12 ';
bulk insert bronze.erp_cust_az12 from
'C:\Users\DELL 5510\Downloads\SQL\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
with ( firstrow = 2,
       fieldterminator = ',',
       tablock);
                set @end_time = getdate()  
                         print 'local duration is ' + cast(datediff(second,@start_time,@end_time) as nvarchar ) + ' secound' ;     
                         set @start_time = getdate()

print 'truncate table loc a101';
 truncate table bronze.erp_loc_a101
 print 'insert table loc a101';
bulk insert bronze.erp_loc_a101 from
'C:\Users\DELL 5510\Downloads\SQL\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
with ( firstrow = 2,
       fieldterminator = ',',
      
     tablock);
                     set @end_time = getdate()  
                                  print 'local duration is ' + cast(datediff(second,@start_time,@end_time) as nvarchar ) + ' secound' ;     
                         set @start_time = getdate()

       print 'truncate table px_cat ';

  truncate table bronze.erp_px_cat_g1v2
  print 'insert table px_cat ';
bulk insert bronze.erp_px_cat_g1v2 from
'C:\Users\DELL 5510\Downloads\SQL\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
with ( firstrow = 2,
       fieldterminator = ',',
       tablock);
                            set @end_time = getdate()  
                                                              print 'local duration is ' + cast(datediff(second,@start_time,@end_time) as nvarchar ) + ' secound' ;     

       set @batch_end_time = getdate()
       print 'the whole time for loading is ' + cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar ) + ' second'
              end try

       begin catch 
       print '============================='
       print'error occured during loading bronze load'
       print 'error message' + error_message() ;
       print 'error number ' + cast(error_number() as nvarchar );
       print 'error message' + cast(error_state() as nvarchar);
       print '=============================='
       end catch

end;
