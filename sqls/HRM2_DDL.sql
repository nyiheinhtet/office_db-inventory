--Master Batch(マスターバッチ)
drop table if exists mst_batch cascade;
CREATE TABLE mst_batch(
    batch_id serial,
    batch_name varchar(10) NOT NULL,
    updated_date timestamp without time zone, 
    primary key(batch_id)
);

--Master Division(マスター分割)
drop table if exists mst_division cascade;
CREATE TABLE mst_division(
    division_id serial,
    division_name varchar(50) NOT NULL,
    updated_date timestamp without time zone,    
    primary key(division_id)
);

--Master Designation(マスター役職)
drop table if exists mst_designation cascade;
CREATE TABLE mst_designation(
    designation_short_name varchar(25) NOT NULL,
    designation_long_name varchar(100) NOT NULL,
    department_id int,
    updated_date timestamp without time zone,    
    designation_level int NOT NULL,
    description varchar(150),
    primary key(designation_short_name,department_id),
    constraint fk_department_id foreign key (department_id) references mst_department(department_id)
    ON UPDATE CASCADE
);

--Master Department(マスター部門)
drop table if exists mst_department cascade;
CREATE TABLE mst_department(
    department_id serial,
    department_name varchar(50) NOT NULL,
	group_e_mail varchar(384),
    division_id int NOT NULL,
    updated_date timestamp without time zone,    
    primary key(department_id),
    constraint fk_division_id foreign key (division_id) references mst_division(division_id)
    ON UPDATE CASCADE
);

--Permission without defining the screen and function id(許可)
drop table if exists permission cascade;
CREATE TABLE if not exists permission(
    division_id int NOT NULL,
    department_id int NOT NULL,
    designation_long_name varchar(100) NOT NULL,
    manager_dashboard_detail boolean default false NOT NULL,
    admin_dashboard_detail boolean default false NOT NULL,
    employee_dashboard_detail boolean NOT NULL,
    fingerprint_import boolean default false NOT NULL,
    myleave_update boolean default false NOT NULL,
    myleave_delete boolean default false NOT NULL,
    adminLeave_register boolean default false NOT NULL,
    absent_register boolean default false NOT NULL,
    leave_approval_update boolean default false NOT NULL,
    leave_approval_detail boolean default false NOT NULL,
    leave_approval_search boolean default false NOT NULL,
    leave_mgn_update boolean default false NOT NULL,
    leave_mgn_delete boolean default false NOT NULL,
    leave_mgn_search boolean default false NOT NULL,
    leave_import boolean default false NOT NULL,
    myOT_update boolean default false NOT NULL,
    myOT_delete boolean default false NOT NULL,
    myOT_detail boolean default false NOT NULL,
    otForm_register boolean default false NOT NULL,
    urgentotForm_register boolean default false NOT NULL,
    otApproval_update boolean default false NOT NULL,
    otApproval_detail boolean default false NOT NULL,
    otApproval_search boolean default false NOT NULL,
    adminOT_update boolean default false NOT NULL,
    adminOT_detail boolean default false NOT NULL,
    adminOT_search boolean default false NOT NULL,
    employee_register boolean default false NOT NULL,
    employeelist_update boolean default false NOT NULL,
    employeelist_detail boolean default false NOT NULL,
    employeelist_search boolean default false NOT NULL,
    employeelist_upload boolean default false NOT NULL,
    payrollMnt_search boolean default false NOT NULL,
    payrollMnt_update boolean default false NOT NULL,
    payrollMnt_detail boolean default false NOT NULL,
    payrollMnt_export boolean default false NOT NULL,
    payrollMnt_download boolean default false NOT NULL,
    leaveReport_update boolean default false NOT NULL,
    leaveReport_search boolean default false NOT NULL,
    leaveReport_export boolean default false NOT NULL,
    absentReport_delete boolean default false NOT NULL,
    absentReport_search boolean default false NOT NULL,
    absentReport_export boolean default false NOT NULL,
    officeReport_update boolean default false NOT NULL,
    officeReport_search boolean default false NOT NULL,
    policy_register boolean default false NOT NULL,
    policy_update boolean default false NOT NULL,
    policy_delete boolean default false NOT NULL,
    mstMnt_register boolean default false NOT NULL,
    mstMnt_update boolean default false NOT NULL,
    mstMnt_delete boolean default false NOT NULL,
    holiday_register boolean default false NOT NULL,
    leaveBalance_import boolean default false NOT NULL,
	
	project_register boolean default false NOT NULL,
	project_update boolean default false NOT NULL,
	project_delete boolean default false NOT NULL,
	project_detail boolean default false NOT NULL,
	project_export boolean default false NOT NULL,
	items_status_register boolean default false NOT NULL,
	items_status_update boolean default false NOT NULL,
	items_status_delete boolean default false NOT NULL,
	items_status_detail boolean default false NOT NULL,
	items_status_export boolean default false NOT NULL,
	item_sub_category_register boolean default false NOT NULL,
	item_sub_category_update boolean default false NOT NULL,
	item_sub_category_delete boolean default false NOT NULL,
	item_sub_category_detail boolean default false NOT NULL,
	item_sub_category_export boolean default false NOT NULL,
	policy_setup_register boolean default false NOT NULL,
	policy_setup_delete boolean default false NOT NULL,
	policy_setup_detail boolean default false NOT NULL,
	policy_setup_export boolean default false NOT NULL,
	main_category_qty_register boolean default false NOT NULL,
	main_category_qty_update boolean default false NOT NULL,
	main_category_qty_delete boolean default false NOT NULL,
	main_category_qty_detail boolean default false NOT NULL,
	main_category_qty_export boolean default false NOT NULL,
	
	import_pc_update boolean default false NOT NULL,
	import_pc_search boolean default false NOT NULL,
	import_pc_export boolean default false NOT NULL,
	import_pc_import boolean default false NOT NULL,
	
	import_monitor_update boolean default false NOT NULL,
	import_monitor_search boolean default false NOT NULL,
	import_monitor_export boolean default false NOT NULL,
	import_monitor_import boolean default false NOT NULL,
	
	import_storage_update boolean default false NOT NULL,
	import_storage_search boolean default false NOT NULL,
	import_storage_export boolean default false NOT NULL,
	import_storage_import boolean default false NOT NULL,
	
	import_accessories_update boolean default false NOT NULL,
	import_accessories_search boolean default false NOT NULL,
	import_accessories_export boolean default false NOT NULL,
	import_accessories_import boolean default false NOT NULL,
	
	import_license_update boolean default false NOT NULL,
	import_license_search boolean default false NOT NULL,
	import_license_export boolean default false NOT NULL,
	import_license_import boolean default false NOT NULL,
	
	import_phone_update boolean default false NOT NULL,
	import_phone_search boolean default false NOT NULL,
	import_phone_export boolean default false NOT NULL,
	import_phone_import boolean default false NOT NULL,
	
	import_stationary_update boolean default false NOT NULL,
	import_stationary_search boolean default false NOT NULL,
	import_stationary_export boolean default false NOT NULL,
	import_stationary_import boolean default false NOT NULL,
	
	import_networkdevice_update boolean default false NOT NULL,
	import_networkdevice_search boolean default false NOT NULL,
	import_networkdevice_export boolean default false NOT NULL,
	import_networkdevice_import boolean default false NOT NULL,
	
	import_others_update boolean default false NOT NULL,
	import_others_search boolean default false NOT NULL,
	import_others_export boolean default false NOT NULL,
	import_others_import boolean default false NOT NULL,
	
	data_analysis_search boolean default false NOT NULL,
	data_analysis_export boolean default false NOT NULL,
	
	item_request_return_list_update boolean default false NOT NULL,
	item_request_return_list_delete boolean default false NOT NULL,
	item_request_return_list_detail boolean default false NOT NULL,
	item_request_return_list_search boolean default false NOT NULL,
	item_request_return_list_export boolean default false NOT NULL,
	
	item_request_register boolean default false NOT NULL,
	item_request_update boolean default false NOT NULL,
	item_request_evidence_file_download boolean default false NOT NULL,
	
	item_request_approval_details_update boolean default false NOT NULL,
	item_request_approval_details boolean default false NOT NULL,
	item_request_approval_evidence_file_download  boolean default false NOT NULL,
	
	item_return_register boolean default false NOT NULL,
	item_return_update boolean default false NOT NULL,
	item_return_evidence_file_download boolean default false NOT NULL,
	
	item_return_approval_details_update boolean default false NOT NULL,
	item_return_approval_details boolean default false NOT NULL,
	item_return_approval_evidence_file_download  boolean default false NOT NULL,
	
	moving_out_in_list_update boolean default false NOT NULL,
	moving_out_in_list_delete boolean default false NOT NULL,
	moving_out_in_list_detail boolean default false NOT NULL,
	moving_out_in_list_search boolean default false NOT NULL,
	moving_out_in_list_export boolean default false NOT NULL,
	
	moving_out_register boolean default false NOT NULL,
	moving_out_evidence_file_download boolean default false NOT NULL,
	
	moving_out_update boolean default false NOT NULL,
	moving_out_update_evidence_file_download boolean default false NOT NULL,
	
	moving_out_approval_details_update boolean default false NOT NULL,
	moving_out_approval_details boolean default false NOT NULL,
	moving_out_approval_details_evidence_file_download boolean default false NOT NULL,
	
	moving_in_request_register boolean default false NOT NULL,
	moving_in_request_register_evidence_file_download boolean default false NOT NULL,
	
	moving_in_request_update boolean default false NOT NULL,
	moving_in_request_update_evidence_file_download boolean default false NOT NULL,
	
	moving_in_approval_details_update boolean default false NOT NULL,
	moving_in_approval_details boolean default false NOT NULL,
	moving_in_approval_details_evidence_file_download boolean default false NOT NULL,
    updated_date timestamp without time zone,
    primary key(division_id,department_id,designation_long_name),
    constraint fk_division_id foreign key (division_id) references mst_division(division_id),
    constraint fk_department_id foreign key (department_id) references mst_department(department_id)
    ON UPDATE CASCADE
);

drop table if exists employee cascade;
create table employee (
  emp_id varchar(5) NOT NULL
  , emp_name varchar(50) NOT NULL
  , nrc text NOT NULL
  , batch_id int NOT NULL
  , passport_no text
  , passport_expired_date timestamp without time zone
  , dob text
  , age int
  , father_name text NOT NULL
  , gender char(2) NOT NULL
  , marital_status varchar(2) NOT NULL
  , no_of_parent int
  , no_of_children int
  , portal_id char(10)
  , live_with_parent char(1)
  , appointed_date timestamp without time zone
  , experience int
  , ap_inf char(2)
  , employee_type text NOT NULL
  , aggrement_start_date text
  , aggrement_end_date text
  , division_id int NOT NULL
  , department varchar(10) NOT NULL
  , current_designation varchar(50) NOT NULL
  , apac_grade text
  , ndmm_grade text
  , reporting_manager varchar(30)
  , university varchar(100)
  , basic_salary text NOT NULL
  , previous_salary text NOT NULL
  , income_tax text
  , social_welfare text
  , updated_date timestamp without time zone
  , primary key (emp_id)
  , constraint fk_batch_id foreign key (batch_id) references mst_batch(batch_id)
  , constraint fk_division_id foreign key (division_id) references mst_division(division_id)
  ON UPDATE CASCADE
);

--Master Project
drop table if exists mst_project cascade;
CREATE TABLE mst_project(
    project_id serial,
    project_name varchar(50) NOT NULL,
	department_name varchar(50) NOT NULL,
    updated_date timestamp without time zone, 
    primary key(project_id)
);

--Master Item Status
drop table if exists mst_item_status cascade;
CREATE TABLE mst_item_status(
    item_status_id serial,
    item_status_name varchar(50) NOT NULL,
	form char(2) NOT NULL,
	offer_receive_status_code char(2) NOT NULL,
	delete_flag boolean default false NOT NULL,
    updated_date timestamp without time zone,
    primary key(item_status_id)
);

--Master Main Category
drop table if exists mst_main_category cascade;
CREATE TABLE mst_main_category(
    main_category_id serial,
    main_category_name varchar(50) NOT NULL,
	delete_flag boolean default false NOT NULL,
    updated_date timestamp without time zone, 
    primary key(main_category_id)
);


--Master Item Sub Category
drop table if exists mst_item_sub_category cascade;
CREATE TABLE mst_item_sub_category(
    sub_category_id serial,
	main_category_id varchar(30),
	sub_category_name varchar(50) NOT NULL,
	delete_flag boolean default false NOT NULL,
    updated_date timestamp without time zone, 
    primary key(sub_category_id)
);

--Master Policy Set Up
drop table if exists mst_item_type_policy_setup cascade;
CREATE TABLE mst_item_type_policy_setup(
    policy_id serial,
	main_category_id varchar(30),
	form char(2) NOT NULL,
	policy_flow_name varchar(50) NOT NULL,
	approval_person varchar(30) NOT NULL,
	approval_person_level int,
	delete_flag boolean default false NOT NULL,
    updated_date timestamp without time zone, 
    primary key(policy_id,main_category_id,form,approval_person_level)
);

--Master NDMM Moving Out Qty
drop table if exists mst_ndmm_moving_out_qty cascade;
CREATE TABLE mst_ndmm_moving_out_qty(
    moving_out_qty_id serial,
	main_category_id varchar(30),
	max_qty varchar(2) default '-' NOT NULL,
    updated_date timestamp without time zone, 
	delete_flag boolean default false NOT NULL,
    primary key(moving_out_qty_id)
);

--Master Items Information
drop table if exists mst_item_info cascade;
CREATE TABLE mst_item_info(
    mst_item_info_id serial,
	main_category_id varchar(30),
	sub_category_id int NOT NULL,
	item_name varchar(50) NOT NULL,
	access_number varchar(50),
	serial_number varchar(50),
	
	item_status_name varchar(50),
	
	original_os varchar(30),
	original_cpu varchar(30),
	original_cpu_type varchar(30),
	original_hdd varchar(30),
	original_ssd varchar(30),
	original_ram varchar(30),
    original_ios_internal_storage varchar(30),
	
	updated_os varchar(30),
	updated_cup varchar(30),
	updated_cpu_type varchar(30),
	updated_hdd varchar(30),
	updated_ssd varchar(30),
	updated_ram varchar(30),
    updated_ios_internal_storage varchar(30),
	
	display_size varchar(10),
	storage_spec varchar(50),
	phone_no varchar(50),
	plan varchar(50),
	location char(2),
	sim_card varchar(50),
	in_qty numeric DEFAULT 0.0,
	out_qty numeric DEFAULT 0.0,
	license_expired_date timestamp without time zone,
	network_item_size varchar(50),
	network_item_length varchar(50),
	brand varchar(50),
	model_no varchar(50),
	unit_price numeric DEFAULT 0.0,
	warranty varchar(50),
	inventory_received_date timestamp without time zone, 
	remarks varchar(150),
    updated_date timestamp without time zone, 
    primary key(mst_item_info_id,main_category_id),
	constraint fk_sub_category_id foreign key (sub_category_id) references mst_item_sub_category(sub_category_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
); 

-- Master Inventory Approval Status 
drop table if exists mst_inventory_approval_status cascade;
CREATE TABLE mst_inventory_approval_status(
    approval_status_code varchar(10) NOT NULL, 
    approval_status_name varchar(50),
    designation_short_name varchar(25),
    primary key(approval_status_code)
);
------------------------Transaction Tables Modify -------------------------------------
drop table if exists request_return_ticket_infos cascade;
create table request_return_ticket_infos (
  request_return_ticket_infos_id int NOT NULL
  , request_return_ticket varchar(50) NOT NULL
  , ticket_mgt_number numeric(5) NOT NULL
  , request_type Char(2) NOT NULL
  , mst_item_info_id int
  , main_category_id varchar(30)
  , items_histories_id int
  , apply_date timestamp without time zone
  , ticket_status_code char(2)
  , approval_status_code varchar(10) NOT NULL
  , return_date timestamp without time zone
  , updated_date timestamp without time zone
  , primary key (request_return_ticket_infos_id,request_return_ticket)
  , constraint fk_mst_item_info_id foreign key (mst_item_info_id,main_category_id) references mst_item_info(mst_item_info_id,main_category_id)
  , constraint fk_approval_status_code foreign key (approval_status_code) references mst_inventory_approval_status(approval_status_code)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );
 
--------- Requested Devices Information -----------------
drop table if exists requested_items_infos cascade;
create table requested_items_infos (
  requested_items_infos_id int NOT NULL
  , request_return_ticket_infos_id int
  , request_return_ticket varchar(50)
  , main_category varchar(50)
  , sub_category varchar(50) 
  , os varchar(30)
  , cpu varchar(30)
  , cpu_type varchar(30)
  , hdd varchar(30)
  , ssd varchar(30)
  , ram varchar(30)
  , os_internal_storage varchar(30)
  , display_size varchar(30)
  , location varchar(30)
  , counts varchar(30)
  , network_device_size varchar(30)
  , network_device_length varchar(30)   
  , request_for_new_pc_flag boolean default true
  , license_pc_access_no varchar(50)
  , existing_license_info varchar(150)
  , details_description varchar(150)
  , received_plan_date timestamp without time zone
  , updated_date timestamp without time zone
  , primary key (requested_items_infos_id)
  , constraint fk_request_return_ticket_info foreign key(request_return_ticket_infos_id,request_return_ticket) references request_return_ticket_infos(request_return_ticket_infos_id,request_return_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );
 
---- Request and Return Approval Person Information ---------
drop table if exists request_return_approval_person_info cascade;
CREATE TABLE request_return_approval_person_info(
  request_return_approval_person_info_id int NOT NULL
  , approval_emp_id varchar(5) NOT NULL
  , approval_mail varchar(384)
  , approval_person_level INT NOT NULL
  , request_return_ticket_infos_id int
  , request_return_ticket varchar(50)
  , policy_flow_name varchar(50) NOT NULL
  , approval_status_code varchar(50) NOT NULL 
  , item_status varchar(50)
  , remarks varchar(150)
  , approve_reject_date timestamp without time zone
  , assign_sub_category_name varchar(50)
  , assign_item_name varchar(50)
  , assign_item_expired_date timestamp without time zone
  , assign_item_access_no varchar(30)
  , assign_item_serial_no varchar(30)
  , assign_counts varchar(30)
  , assign_item_size varchar(30)
  , assign_item_length varchar(30)
  , assigned_date timestamp without time zone
  , appointed_date timestamp without time zone
  , return_received_date timestamp without time zone  
  , updated_date timestamp without time zone
  , primary key (request_return_approval_person_info_id)
  , constraint fk_request_return_ticket_info foreign key(request_return_ticket_infos_id,request_return_ticket) references request_return_ticket_infos(request_return_ticket_infos_id,request_return_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

---- Request and Return Requester and User Information--------
drop table if exists request_return_user_info cascade;
CREATE TABLE request_return_user_info(
  request_return_user_info_id int NOT NULL
  , request_return_ticket_infos_id int
  , request_return_ticket varchar(50)
  , requester_ee_id varchar(5)
  , request_for_other_person boolean default false NOT NULL
  , user_ee_id varchar(5)
  , approval_evidence_file_path text
  , domain_user_id varchar(10) NOT NULL
  , project_name varchar(50) NOT NULL
  , remarks varchar(150)
  
  , user_received_sub_category_name text
  , user_received_date timestamp without time zone
  , received_status varchar(30)
  , received_conditions varchar(150)
  
  , updated_date timestamp without time zone
  , primary key (request_return_user_info_id)
  , constraint fk_request_return_ticket_info foreign key(request_return_ticket_infos_id,request_return_ticket) references request_return_ticket_infos(request_return_ticket_infos_id,request_return_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

---- Moving Out In Ticket Information--------
drop table if exists mov_out_in_ticket_infos cascade;
CREATE TABLE mov_out_in_ticket_infos(
  mov_out_in_ticket_infos_id int NOT NULL
  , ticket_mgt_number numeric(5) NOT NULL
  , mov_out_in_ticket varchar(50) NOT NULL
  , ticket_process_type Char(2) NOT NULL
  , security_flag boolean default false NOT NULL
  , start_date timestamp without time zone
  , end_date timestamp without time zone
  , reason varchar(150)
  , address varchar(150)
  , sub_ticket varchar(50)
  , period_of_start_date timestamp without time zone
  , peroid_of_end_date timestamp without time zone
  , apply_date timestamp without time zone
  , approval_status_code varchar(50)
  , handover_flag boolean default false NOT NULL
  , updated_date timestamp without time zone
  , primary key (mov_out_in_ticket_infos_id,mov_out_in_ticket)
  , constraint fk_approval_status_code foreign key (approval_status_code) references mst_inventory_approval_status(approval_status_code)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

---------- Moving Out In Security Information--------------
drop table if exists security_info cascade;
CREATE TABLE security_info(
  security_id int NOT NULL
  , mov_out_in_ticket_infos_id int
  , mov_out_in_ticket varchar(50)
  , important_project_store boolean default false
  , antivirus_check boolean default false
  , security_patch_check boolean default false
  , encryption_check boolean default false
  , updated_date timestamp without time zone
  , primary key (security_id)
  , constraint fk_guest_mov_out_in foreign key (mov_out_in_ticket_infos_id,mov_out_in_ticket) references mov_out_in_ticket_infos(mov_out_in_ticket_infos_id,mov_out_in_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
---- Moving Out In Requester And User Information--------
drop table if exists mov_out_in_user_info cascade;
CREATE TABLE mov_out_in_user_info(
  mov_out_in_user_info_id int NOT NULL
  , mov_out_in_ticket_infos_id int
  , mov_out_in_ticket varchar(50)
  , requester_ee_id varchar(5)
  , request_for_other_person boolean default false NOT NULL
  , user_ee_id varchar(5)
  , approval_evidence_file_path text
  , guest_name varchar(50)
  , guest_mail varchar(50)
  , guest_department_name varchar(50)
  , project_name varchar(50) NOT NULL
  , remarks varchar(150)
  , updated_date timestamp without time zone
  , primary key (mov_out_in_user_info_id)
  , constraint fk_requester_ee_id foreign key (requester_ee_id) references employee(emp_id)
  , constraint fk_user_ee_id foreign key (user_ee_id) references employee(emp_id)
  , constraint fk_guest_mov_out_in foreign key (mov_out_in_ticket_infos_id,mov_out_in_ticket) references mov_out_in_ticket_infos(mov_out_in_ticket_infos_id,mov_out_in_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

-----Moving Out In 	Approval Person Information ---------
drop table if exists mov_out_in_approval_person_info cascade;
CREATE TABLE mov_out_in_approval_person_info(
  mov_out_in_approval_person_info_id int NOT NULL
  , approval_emp_id varchar(5) NOT NULL
  , approval_mail varchar(384)
  , approval_person_level int
  , mov_out_in_ticket_infos_id int
  , mov_out_in_ticket varchar(50)
  , policy_flow_name varchar(50) NOT NULL
  , approval_status_code varchar(50)
  , item_status varchar(50)
  , remarks varchar(150)
  , approve_reject_date timestamp without time zone
  , updated_date timestamp without time zone
  , primary key (mov_out_in_approval_person_info_id)
  , constraint fk_mov_out_in_ticket foreign key(mov_out_in_ticket_infos_id,mov_out_in_ticket) references mov_out_in_ticket_infos(mov_out_in_ticket_infos_id,mov_out_in_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
----- Guest Decives Information -----------------------
drop table if exists guest_devices cascade;
CREATE TABLE guest_devices(
  guest_devices_id int NOT NULL
  , mov_out_in_ticket_infos_id int
  , mov_out_in_ticket varchar(50)
  , main_category varchar(50)
  , sub_category varchar(50)
  , policy_flow_name varchar(50)
  , access_number varchar(50)
  , serial_number varchar(50)
  , counts varchar(10)
  , network_device_size varchar(10)
  , network_device_length varchar(10)
  , updated_date timestamp without time zone
  , primary key (guest_devices_id)
  , constraint fk_guest_mov_in foreign key (mov_out_in_ticket_infos_id,mov_out_in_ticket) references mov_out_in_ticket_infos(mov_out_in_ticket_infos_id,mov_out_in_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
----- Handover User Information -----------------------
drop table if exists handover_info cascade;
CREATE TABLE handover_info(
  handover_info_id int NOT NULL
  , request_return_ticket_infos_id int
  , request_return_ticket varchar(50)
  , mov_out_in_ticket_infos_id int
  , mov_out_in_ticket varchar(50)
  , handover_emp_id varchar(5)
  , handover_reason varchar(150)
  , updated_date timestamp without time zone
  , primary key (handover_info_id)
  , constraint fk_handover_emp_id foreign key (handover_emp_id) references employee(emp_id)
  , constraint fk_return foreign key (request_return_ticket_infos_id,request_return_ticket) references request_return_ticket_infos(request_return_ticket_infos_id,request_return_ticket)
  , constraint fk_other_guest_mov_in foreign key (mov_out_in_ticket_infos_id,mov_out_in_ticket) references mov_out_in_ticket_infos(mov_out_in_ticket_infos_id,mov_out_in_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
--- End----------------------------------------------------
drop table if exists items_histories cascade;
CREATE TABLE items_histories(
  items_histories_id int NOT NULL
  , mst_item_info_id int
  , main_category_id varchar(30) 
  , request_return_ticket_infos_id int
  , request_return_ticket varchar(50)
  , mov_out_in_ticket_infos_id int
  , mov_out_in_ticket  varchar(50)
  , access_number varchar(50)
 
  , user_ee_id varchar(5)
  , guest_name varchar(50)
  , guest_mail varchar(50)
  , department_name varchar(50) 
  , project_name varchar(50)
  , item_name varchar(50)
  , item_counts varchar(10)
  , network_device_length varchar(10)
  , network_device_size varchar(10)

  , user_received_date timestamp without time zone
  , return_received_date timestamp without time zone
  
  , start_date timestamp without time zone
  , end_date timestamp without time zone
  
  , item_histories_status char(2)
  , updated_date timestamp without time zone
  , primary key (items_histories_id)
  , constraint fk_mst_item_info_id foreign key (mst_item_info_id,main_category_id) references mst_item_info(mst_item_info_id,main_category_id)
  , constraint fk_user_ee_id foreign key (user_ee_id) references employee(emp_id)
  , constraint fk_return foreign key (request_return_ticket_infos_id,request_return_ticket) references request_return_ticket_infos(request_return_ticket_infos_id,request_return_ticket)
  , constraint fk_other_guest_mov_in foreign key (mov_out_in_ticket_infos_id,mov_out_in_ticket) references mov_out_in_ticket_infos(mov_out_in_ticket_infos_id,mov_out_in_ticket)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);