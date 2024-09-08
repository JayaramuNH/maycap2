using { mycap2.db  } from '../db/datamodel';

service demoservice {

    function spiderman (to:String) returns String;

    @readonly
    entity ReadEmpSrv as projection on db.master.employees;
     @insertonly
    entity InserEmployeeSrv as projection on db.master.employees;
    @updateonly
    entity UpdateEmployeeSrv as projection on db.master.employees;
    @deleteonly
    entity DeleteEmployeeSrv as projection on db.master.employees;
}