prompt PL/SQL Developer import file
prompt Created on 2010年9月1日 星期三 by Administrator
set feedback off
set define off
prompt Creating QS_TM_COMPANY...
create table QS_TM_COMPANY
(
  COMPANY_CODE    VARCHAR2(10) not null,
  COMPANY_NAME    VARCHAR2(120) not null,
  PARENT_COM_CODE VARCHAR2(10),
  SHORT_NAME      VARCHAR2(60),
  COMPANY_ORDER   NUMBER(8) not null,
  PHONE_NUMBER    VARCHAR2(30),
  ADDRESS         VARCHAR2(300),
  ZIPCODE         VARCHAR2(30),
  FAX             VARCHAR2(30),
  STATUS          NUMBER(8),
  CREATE_DATE     DATE,
  CREATE_BY       NUMBER(8)
)
;
alter table QS_TM_COMPANY
  add constraint PK_QS_TM_COMPANY primary key (COMPANY_CODE);

prompt Creating QS_TM_MENU...
create table QS_TM_MENU
(
  MENU_ID        NUMBER(8) not null,
  MENU_NAME      VARCHAR2(60) not null,
  MENU_TYPE      NUMBER(8),
  MENU_FUNCTION  VARCHAR2(60),
  MENU_ORDER     NUMBER(4),
  PARENT_MENU_ID NUMBER(8),
  IS_BASE_ADMIN  NUMBER(8),
  STATUS         NUMBER(8) not null,
  CREATE_DATE    DATE,
  CREATE_BY      NUMBER(8)
)
;
alter table QS_TM_MENU
  add constraint PK_QS_TM_MENU primary key (MENU_ID);

prompt Creating QS_TM_ROLE...
create table QS_TM_ROLE
(
  ROLE_ID      NUMBER(8) not null,
  COMPANY_CODE VARCHAR2(10) not null,
  ROLE_ORDER   NUMBER(8),
  ROLE_TYPE    NUMBER(8),
  ROLE_CODE    VARCHAR2(30),
  ROLE_NAME    VARCHAR2(60),
  ROLE_STATUS  NUMBER(8),
  CREATE_DATE  DATE,
  CREATE_BY    NUMBER(8)
)
;
alter table QS_TM_ROLE
  add constraint PK_QS_TM_ROLE primary key (ROLE_ID);

prompt Creating QS_TM_MENU_ROLE...
create table QS_TM_MENU_ROLE
(
  MENU_ROLE_ID NUMBER(8) not null,
  ROLE_ID      NUMBER(8) not null,
  MENU_ID      NUMBER(8) not null,
  CREATE_DATE  DATE,
  CREATE_BY    NUMBER(8),
  COMPANY_CODE VARCHAR2(10)
)
;
alter table QS_TM_MENU_ROLE
  add constraint PK_QS_TM_MENU_ROLE primary key (MENU_ROLE_ID);
alter table QS_TM_MENU_ROLE
  add constraint FK_QS_TM_MENU__REFERENCE_QS_TM_MENU foreign key (MENU_ID)
  references QS_TM_MENU (MENU_ID);
alter table QS_TM_MENU_ROLE
  add constraint FK_QS_TM_MENU__REFERENCE_QS_TM_ROLE foreign key (ROLE_ID)
  references QS_TM_ROLE (ROLE_ID);

prompt Creating QS_TM_ORG...
create table QS_TM_ORG
(
  ORG_ID          NUMBER(8) not null,
  COMPANY_CODE    VARCHAR2(10),
  ORG_CODE        VARCHAR2(10) not null,
  ORG_NAME        VARCHAR2(150),
  PARENT_ORG_CODE VARCHAR2(10),
  ORG_ORDER       NUMBER(8),
  REMARK          VARCHAR2(300),
  STATUS          NUMBER(8),
  CREATE_DATE     DATE,
  CREATE_BY       NUMBER(8)
)
;
alter table QS_TM_ORG
  add constraint PK_QS_TM_ORG primary key (ORG_ID);
alter table QS_TM_ORG
  add constraint FK_QS_TM_ORG_REFERENCE_QS_TM_COMPA foreign key (COMPANY_CODE)
  references QS_TM_COMPANY (COMPANY_CODE);

prompt Creating QS_TM_POSITION...
create table QS_TM_POSITION
(
  POSITION_ID    NUMBER(8) not null,
  COMPANY_CODE   VARCHAR2(10) not null,
  ORG_CODE       VARCHAR2(10),
  POSITION_NAME  VARCHAR2(60) not null,
  POSITION_ORDER NUMBER(8),
  STATUS         NUMBER(8) not null,
  MEMO           VARCHAR2(120),
  CREATE_DATE    DATE,
  CREATE_BY      NUMBER(8),
  ORG_ID         NUMBER(8)
)
;
comment on table QS_TM_POSITION
  is '记录具体的用户职位，表示某个具体人员，包含角色、组织编号';
alter table QS_TM_POSITION
  add constraint PK_QS_TM_POSITION primary key (POSITION_ID);

prompt Creating QS_TM_POSITION_ROLE...
create table QS_TM_POSITION_ROLE
(
  POSITION_ROLE_ID NUMBER(8) not null,
  POSITION_ID      NUMBER(8) not null,
  ROLE_ID          NUMBER(8) not null,
  CREATE_DATE      DATE,
  CREATE_BY        NUMBER(8),
  COMPANY_CODE     VARCHAR2(10)
)
;
comment on table QS_TM_POSITION_ROLE
  is '系统角色ROLE和用户职位POSITION的对照关系组织表';
alter table QS_TM_POSITION_ROLE
  add constraint PK_QS_TM_POSITION_ROLE primary key (POSITION_ROLE_ID);
alter table QS_TM_POSITION_ROLE
  add constraint FK_QS_TM_POSIT_POSROLE_QS_TM_POSIT foreign key (POSITION_ID)
  references QS_TM_POSITION (POSITION_ID);
alter table QS_TM_POSITION_ROLE
  add constraint FK_QS_TM_POSIT_REFERENCE_QS_TM_ROLE foreign key (ROLE_ID)
  references QS_TM_ROLE (ROLE_ID);

prompt Creating QS_TM_USER...
create table QS_TM_USER
(
  USER_ID         NUMBER(4) not null,
  COMPANY_CODE    VARCHAR2(10) not null,
  USER_NAME       VARCHAR2(20) not null,
  PINYIN_NAME     VARCHAR2(20),
  PASSWORD        VARCHAR2(32) not null,
  REAL_NAME       VARCHAR2(60) not null,
  SEX             CHAR(2),
  MOBILE_PHONE    VARCHAR2(60),
  PHONE           VARCHAR2(60),
  EMAIL           VARCHAR2(120),
  BIRTHDAY        DATE,
  ADDRESS         VARCHAR2(300),
  ZIP_CODE        VARCHAR2(10),
  STATUS_ID       NUMBER(8) not null,
  LAST_LOGIN_TIME DATE,
  LAST_LOGIN_IP   VARCHAR2(15),
  CREATE_DATE     DATE,
  CREATE_BY       NUMBER(8),
  IS_LOGIN        NUMBER(1),
  IS_CHECKER      VARCHAR2(10),
  MANAGEMENT_CODE VARCHAR2(10)
)
;
comment on table QS_TM_USER
  is '系统中所有的用户信息。';
comment on column QS_TM_USER.PASSWORD
  is '此处保存密码的MD5加密字符串';
comment on column QS_TM_USER.REAL_NAME
  is '用户真是姓名';
comment on column QS_TM_USER.PHONE
  is '固定电话';
comment on column QS_TM_USER.EMAIL
  is '用户联系电子信箱';
comment on column QS_TM_USER.IS_LOGIN
  is '0代表不能登陆，1代表可以登陆';
comment on column QS_TM_USER.MANAGEMENT_CODE
  is '用户管理人员的权限，-1代表无权限，0代表超级管理员，其它公司或部门代码';
alter table QS_TM_USER
  add constraint PK_QS_TM_USER primary key (USER_ID);

prompt Creating QS_TM_POSITION_USER...
create table QS_TM_POSITION_USER
(
  ID           NUMBER(8) not null,
  POSITION_ID  NUMBER(8) not null,
  USER_ID      NUMBER(8) not null,
  CREATE_DATE  DATE,
  CREATE_BY    NUMBER(8),
  COMPANY_CODE VARCHAR2(10)
)
;
comment on table QS_TM_POSITION_USER
  is '系统用户USER和职位POSITION的对照关系组织表';
alter table QS_TM_POSITION_USER
  add constraint PK_QS_TM_POSITION_USER primary key (ID);
alter table QS_TM_POSITION_USER
  add constraint FK_QS_TM_POSIT_POSUSER_QS_TM_POSIT foreign key (POSITION_ID)
  references QS_TM_POSITION (POSITION_ID);
alter table QS_TM_POSITION_USER
  add constraint FK_QS_TM_POSIT_REFERENCE_QS_TM_USER foreign key (USER_ID)
  references QS_TM_USER (USER_ID);

prompt Creating QS_TM_USERSTATUS...
create table QS_TM_USERSTATUS
(
  STATUS_ID NUMBER(8) not null,
  STATUS    VARCHAR2(10) not null
)
;
alter table QS_TM_USERSTATUS
  add constraint PK_QS_TM_USERSTATUS primary key (STATUS_ID);

prompt Loading QS_TM_COMPANY...
insert into QS_TM_COMPANY (COMPANY_CODE, COMPANY_NAME, PARENT_COM_CODE, SHORT_NAME, COMPANY_ORDER, PHONE_NUMBER, ADDRESS, ZIPCODE, FAX, STATUS, CREATE_DATE, CREATE_BY)
values ('00', '内蒙农信', '0', '内蒙农信', 1, null, null, null, null, 1, null, null);
commit;
prompt 1 records loaded
prompt Loading QS_TM_MENU...
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (6, '已销户存款帐户信息查询', 5, 'cancelAcctSaveBal.do?method=findCert', 1, 5, null, 1, to_date('30-07-2010 08:48:12', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (4, '分析数据查询', 0, 'blank', 5, 0, null, 0, to_date('11-08-2010 10:05:04', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (5, '存款历史查询', 0, 'blank', 1, 0, null, 0, to_date('27-02-2010 07:45:07', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (7, '存款明细查询', 5, 'saveList.do?method=firstOper', 2, 5, null, 1, to_date('26-02-2010 03:04:34', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (8, '开销户情况查询', 5, 'acctStateList.do?method=firstOper', 3, 5, null, 1, to_date('11-08-2010 09:45:51', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (54, '单位管理', 1, 'companyManage.do?method=queryCompany', 5, 1, null, 1, to_date('13-08-2010 15:15:22', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (10, '现代支付业务登记簿查询', 5, '/bb', 5, 5, null, 1, to_date('11-08-2010 09:50:24', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (11, '农信银业务登记簿查询', 5, '/bb', 6, 5, null, 1, to_date('11-08-2010 09:51:25', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (55, '部门管理', 1, 'orgManage.do?method=queryOrg', 6, 1, null, 1, to_date('13-08-2010 15:15:59', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (56, '职位管理', 1, 'positionManage.do?method=queryPosition', 7, 1, null, 1, to_date('13-08-2010 15:16:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (14, '股金分红查询', 5, '/bb', 9, 5, null, 1, to_date('19-02-2010 02:08:41', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (15, '特殊业务登记薄查询', 5, '/dd', 3, 5, null, 1, to_date('11-08-2010 09:45:31', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (37, '电子档案', 0, 'blank', 6, 0, null, 0, to_date('11-08-2010 10:04:59', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (40, '历史营业日/月报', 37, 'dd', 6, 37, null, 1, to_date('11-08-2010 10:02:53', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (41, '电子账页', 37, 'elecAcct.do?method=firstOper', 1, 37, null, 1, to_date('11-08-2010 10:00:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (42, '历史流水', 37, 'dd', 2, 37, null, 1, to_date('11-08-2010 10:00:45', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (43, '历史总账', 37, 'dd', 3, 37, null, 1, to_date('11-08-2010 10:01:05', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (44, '现金收付明细表', 37, 'dd', 4, 37, null, 1, to_date('11-08-2010 10:01:34', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (45, '凭证收付明细表', 37, 'dd', 5, 37, null, 1, to_date('11-08-2010 10:02:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (16, '贷款历史查询', 0, null, 2, 0, null, 0, to_date('27-02-2010 07:45:50', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (17, '贷款信息查询', 16, 'dd', 1, 16, null, 1, to_date('11-08-2010 09:54:09', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (18, '贷款明细查询', 16, 'dd', 2, 16, null, 1, to_date('11-08-2010 09:54:41', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (19, '贷款展期登记簿查询', 16, 'dd', 3, 16, null, 1, to_date('11-08-2010 09:55:12', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (20, '贷款开销户情况查询', 16, 'dd', 4, 16, null, 1, to_date('11-08-2010 10:14:03', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (1, '系统管理', 0, null, 9, 0, null, 0, to_date('27-02-2010 07:50:20', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (2, '菜单维护', 1, 'menuMaintenance.do?method=queryMenu', 3, 1, 0, 1, to_date('11-08-2010 10:04:26', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (24, '贴现登记簿查询', 16, 'dd', 5, 16, null, 1, to_date('11-08-2010 10:15:25', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (25, '资金调剂登记簿查询', 16, 'dd', 6, 16, null, 1, to_date('11-08-2010 10:16:02', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (26, '额度历史信息查询', 16, 'dd', 7, 16, null, 1, to_date('11-08-2010 10:17:05', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (27, '担保品登记簿查询', 16, 'dd', 8, 16, null, 1, to_date('11-08-2010 10:17:10', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (28, '公共历史数据查询', 0, 'bland', 3, 0, null, 0, to_date('11-08-2010 10:17:52', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (29, '历史交易核心记账流水查询', 28, 'dd', 1, 28, null, 1, to_date('11-08-2010 09:57:11', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (30, '历史交易外挂流水查询', 28, 'dd', 2, 28, null, 1, to_date('11-08-2010 09:57:35', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (31, '客户信息查询', 28, 'dd', 3, 28, null, 1, to_date('11-08-2010 09:57:51', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (32, '总帐数据查询', 0, 'blank', 4, 0, null, 0, to_date('11-08-2010 10:18:24', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (33, '总账历史余额查询', 32, 'dd', 1, 32, null, 1, to_date('27-02-2010 07:43:45', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (34, '总账历史明细查询', 32, 'dd', 2, 32, null, 1, to_date('27-02-2010 07:43:54', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (48, '客户账户关系查询', 28, 'dd', 4, 28, null, 1, to_date('11-08-2010 09:58:14', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (49, '存款发展趋势(图)', 4, '/dd', 1, 4, null, 1, to_date('11-08-2010 09:59:48', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (50, '贷款业务趋势(图)', 4, '/dd', 2, 4, null, 1, to_date('11-08-2010 10:00:03', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (51, '角色权限', 1, 'page/sysmanage/roleManage.jsp', 1, 1, null, 1, to_date('13-08-2010 15:21:57', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (52, '用户管理', 1, 'userManage.do?method=queryUser', 2, 1, null, 1, to_date('11-08-2010 10:04:31', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into QS_TM_MENU (MENU_ID, MENU_NAME, MENU_TYPE, MENU_FUNCTION, MENU_ORDER, PARENT_MENU_ID, IS_BASE_ADMIN, STATUS, CREATE_DATE, CREATE_BY)
values (53, '重要变更查询', 5, 'dd', 4, 5, null, 1, to_date('11-08-2010 10:25:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;
prompt 43 records loaded
prompt Loading QS_TM_ROLE...
insert into QS_TM_ROLE (ROLE_ID, COMPANY_CODE, ROLE_ORDER, ROLE_TYPE, ROLE_CODE, ROLE_NAME, ROLE_STATUS, CREATE_DATE, CREATE_BY)
values (2, '00', 1, null, null, '管理员', 0, to_date('13-08-2010 17:30:36', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;
prompt 1 records loaded
prompt Loading QS_TM_MENU_ROLE...
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (41, 2, 4, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (42, 2, 49, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (43, 2, 50, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (44, 2, 5, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (45, 2, 6, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (46, 2, 7, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (47, 2, 8, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (48, 2, 10, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (49, 2, 11, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (50, 2, 14, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (51, 2, 15, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (52, 2, 53, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (53, 2, 37, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (54, 2, 40, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (55, 2, 41, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (56, 2, 42, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (57, 2, 43, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (58, 2, 44, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (59, 2, 45, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (60, 2, 16, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (61, 2, 17, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (62, 2, 18, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (63, 2, 19, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (64, 2, 20, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (65, 2, 24, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (66, 2, 25, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (67, 2, 26, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (68, 2, 27, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (69, 2, 1, to_date('13-08-2010 17:30:50', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (70, 2, 54, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (71, 2, 55, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (72, 2, 56, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (73, 2, 2, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (74, 2, 51, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (75, 2, 52, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (76, 2, 28, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (77, 2, 29, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (78, 2, 30, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (79, 2, 31, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_MENU_ROLE (MENU_ROLE_ID, ROLE_ID, MENU_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (80, 2, 48, to_date('13-08-2010 17:30:51', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
commit;
prompt 40 records loaded
prompt Loading QS_TM_ORG...
insert into QS_TM_ORG (ORG_ID, COMPANY_CODE, ORG_CODE, ORG_NAME, PARENT_ORG_CODE, ORG_ORDER, REMARK, STATUS, CREATE_DATE, CREATE_BY)
values (1, '00', '0002', '科技处', '00', 2, null, 2, to_date('16-08-2010 10:26:53', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;
prompt 1 records loaded
prompt Loading QS_TM_POSITION...
insert into QS_TM_POSITION (POSITION_ID, COMPANY_CODE, ORG_CODE, POSITION_NAME, POSITION_ORDER, STATUS, MEMO, CREATE_DATE, CREATE_BY, ORG_ID)
values (6, '00', '0002', '处长', 1, 3, '2', to_date('16-08-2010 11:02:39', 'dd-mm-yyyy hh24:mi:ss'), 0, 1);
insert into QS_TM_POSITION (POSITION_ID, COMPANY_CODE, ORG_CODE, POSITION_NAME, POSITION_ORDER, STATUS, MEMO, CREATE_DATE, CREATE_BY, ORG_ID)
values (7, '00', '0002', '副处长', 2, 3, '1', to_date('16-08-2010 11:05:12', 'dd-mm-yyyy hh24:mi:ss'), 0, 1);
insert into QS_TM_POSITION (POSITION_ID, COMPANY_CODE, ORG_CODE, POSITION_NAME, POSITION_ORDER, STATUS, MEMO, CREATE_DATE, CREATE_BY, ORG_ID)
values (8, '00', '0002', '科员', 3, 3, null, to_date('16-08-2010 11:28:53', 'dd-mm-yyyy hh24:mi:ss'), 0, 1);
commit;
prompt 3 records loaded
prompt Loading QS_TM_POSITION_ROLE...
insert into QS_TM_POSITION_ROLE (POSITION_ROLE_ID, POSITION_ID, ROLE_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (1, 6, 2, to_date('16-08-2010 11:02:39', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_POSITION_ROLE (POSITION_ROLE_ID, POSITION_ID, ROLE_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (2, 7, 2, to_date('16-08-2010 11:05:12', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_POSITION_ROLE (POSITION_ROLE_ID, POSITION_ID, ROLE_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (3, 8, 2, to_date('16-08-2010 11:28:53', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
commit;
prompt 3 records loaded
prompt Loading QS_TM_USER...
insert into QS_TM_USER (USER_ID, COMPANY_CODE, USER_NAME, PINYIN_NAME, PASSWORD, REAL_NAME, SEX, MOBILE_PHONE, PHONE, EMAIL, BIRTHDAY, ADDRESS, ZIP_CODE, STATUS_ID, LAST_LOGIN_TIME, LAST_LOGIN_IP, CREATE_DATE, CREATE_BY, IS_LOGIN, IS_CHECKER, MANAGEMENT_CODE)
values (0, '00', 'system', 'system', '670b14728ad9902aecba32e22fa4f6bd', 'system', null, null, null, null, null, null, null, 1, to_date('26-08-2010 13:48:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', null, null, null, null, 'admin');
insert into QS_TM_USER (USER_ID, COMPANY_CODE, USER_NAME, PINYIN_NAME, PASSWORD, REAL_NAME, SEX, MOBILE_PHONE, PHONE, EMAIL, BIRTHDAY, ADDRESS, ZIP_CODE, STATUS_ID, LAST_LOGIN_TIME, LAST_LOGIN_IP, CREATE_DATE, CREATE_BY, IS_LOGIN, IS_CHECKER, MANAGEMENT_CODE)
values (1, '00', 'user1', 'user', '670b14728ad9902aecba32e22fa4f6bd', '何处', '男', '1231232132', null, null, to_date('04-08-2010', 'dd-mm-yyyy'), '内蒙联社', null, 1, null, null, to_date('16-08-2010 11:22:13', 'dd-mm-yyyy hh24:mi:ss'), 0, 1, null, 'admin');
insert into QS_TM_USER (USER_ID, COMPANY_CODE, USER_NAME, PINYIN_NAME, PASSWORD, REAL_NAME, SEX, MOBILE_PHONE, PHONE, EMAIL, BIRTHDAY, ADDRESS, ZIP_CODE, STATUS_ID, LAST_LOGIN_TIME, LAST_LOGIN_IP, CREATE_DATE, CREATE_BY, IS_LOGIN, IS_CHECKER, MANAGEMENT_CODE)
values (2, '00', 'user2', '23', '670b14728ad9902aecba32e22fa4f6bd', '123', '男', '123213213', null, null, to_date('04-08-2010', 'dd-mm-yyyy'), '12323', null, 1, null, null, to_date('16-08-2010 11:25:38', 'dd-mm-yyyy hh24:mi:ss'), 0, 1, null, 'no');
insert into QS_TM_USER (USER_ID, COMPANY_CODE, USER_NAME, PINYIN_NAME, PASSWORD, REAL_NAME, SEX, MOBILE_PHONE, PHONE, EMAIL, BIRTHDAY, ADDRESS, ZIP_CODE, STATUS_ID, LAST_LOGIN_TIME, LAST_LOGIN_IP, CREATE_DATE, CREATE_BY, IS_LOGIN, IS_CHECKER, MANAGEMENT_CODE)
values (3, '00', 'user3', '322', '670b14728ad9902aecba32e22fa4f6bd', '2342', '男', '234343', null, null, to_date('02-08-2010', 'dd-mm-yyyy'), '3243242', null, 1, null, null, to_date('16-08-2010 11:35:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 1, null, 'no');
insert into QS_TM_USER (USER_ID, COMPANY_CODE, USER_NAME, PINYIN_NAME, PASSWORD, REAL_NAME, SEX, MOBILE_PHONE, PHONE, EMAIL, BIRTHDAY, ADDRESS, ZIP_CODE, STATUS_ID, LAST_LOGIN_TIME, LAST_LOGIN_IP, CREATE_DATE, CREATE_BY, IS_LOGIN, IS_CHECKER, MANAGEMENT_CODE)
values (4, '00', '213', '23', '670b14728ad9902aecba32e22fa4f6bd', '23', '男', '23', null, null, to_date('03-08-2010', 'dd-mm-yyyy'), '2323', null, 1, null, null, to_date('16-08-2010 11:30:58', 'dd-mm-yyyy hh24:mi:ss'), 0, 1, null, 'no');
insert into QS_TM_USER (USER_ID, COMPANY_CODE, USER_NAME, PINYIN_NAME, PASSWORD, REAL_NAME, SEX, MOBILE_PHONE, PHONE, EMAIL, BIRTHDAY, ADDRESS, ZIP_CODE, STATUS_ID, LAST_LOGIN_TIME, LAST_LOGIN_IP, CREATE_DATE, CREATE_BY, IS_LOGIN, IS_CHECKER, MANAGEMENT_CODE)
values (5, '00', '21323', '23', '670b14728ad9902aecba32e22fa4f6bd', '23', '男', '2323', null, null, to_date('03-08-2010', 'dd-mm-yyyy'), '232', null, 1, null, null, to_date('16-08-2010 11:31:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 1, null, 'no');
commit;
prompt 6 records loaded
prompt Loading QS_TM_POSITION_USER...
insert into QS_TM_POSITION_USER (ID, POSITION_ID, USER_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (1, 6, 1, to_date('16-08-2010 11:22:13', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_POSITION_USER (ID, POSITION_ID, USER_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (2, 7, 2, to_date('16-08-2010 11:25:38', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_POSITION_USER (ID, POSITION_ID, USER_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (3, 7, 3, to_date('16-08-2010 11:35:35', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_POSITION_USER (ID, POSITION_ID, USER_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (4, 8, 4, to_date('16-08-2010 11:31:02', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
insert into QS_TM_POSITION_USER (ID, POSITION_ID, USER_ID, CREATE_DATE, CREATE_BY, COMPANY_CODE)
values (5, 8, 5, to_date('16-08-2010 11:31:59', 'dd-mm-yyyy hh24:mi:ss'), 0, '00');
commit;
prompt 5 records loaded
prompt Loading QS_TM_USERSTATUS...
insert into QS_TM_USERSTATUS (STATUS_ID, STATUS)
values (1, '在职');
insert into QS_TM_USERSTATUS (STATUS_ID, STATUS)
values (2, '出差');
insert into QS_TM_USERSTATUS (STATUS_ID, STATUS)
values (3, '离职');
commit;
prompt 3 records loaded
set feedback on
set define on
prompt Done.
