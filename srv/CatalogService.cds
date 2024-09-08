using { mycap2.db } from '../db/datamodel';
using { mycap2.CDSViews } from '../db/CDSViews';


// service CatalogService @(path:'CatalogService') {

//     @Capabilities : { Insertable, Deletable: false }
//     entity BusinessPartnerSet as projection on db.master.businesspartner; 
//     entity AddressSet as projection on db.master.address;
//    // @readonly
//     entity EmployeeSet as projection on db.master.employees;
//     entity PurchaseOrderItems as projection on db.transaction.poitems;
//     entity POs @( odata.draft.enabled: true)as projection on db.transaction.purchaseorder{
//         *,
//         round(GROSS_AMOUNT) as GROSS_AMOUNT: Decimal(10,2),
//         Items: redirected to PurchaseOrderItems
//     }actions{
//         @Common.SideEffects : {
//             TargetProperties:['in/GROSS_AMOUNT']            
//         }
//         action boost();
//         function largestOrder() returns array of POs;
//     };
//     entity CProductValuesView as projection on CDSViews.CDSViews.CProductValuesView;

// }

 //test;
 //test2

 test3


service CatalogService @(path : 'CatalogService') {
    //@Capabilities.Updatable: false
    entity BusinessPartnerSet as projection on db.master.businesspartner;
    entity AddressSet as projection on db.master.address;
    //@readonly
    entity EmployeeSet as projection on db.master.employees {
        ID,
        nameFirst,
        nameLast,
        sex,
        phoneNumber,
        email,
        salaryAmount
    };
    entity PurchaseOrderItems as projection on db.transaction.poitems;
    entity POs @(
        odata.draft.enabled: true
    ) as projection on db.transaction.purchaseorder{
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'P' then 'Paid'
            when 'B' then 'Blocked'
            else 'Delivered' end as OVERALL_STATUS: String(20),
        case OVERALL_STATUS
            when 'N' then 0
            when 'P' then 1
            when 'B' then 2
            else 3 end as Criticality: Integer,
            Items: redirected to PurchaseOrderItems

    }
    actions{
        
        function largestOrder() returns array of POs;
        action boost() returns POs;
        
    };
    
    entity ProductSet as projection on db.master.product;
    // entity PurchaseOrderSet as projection on cds.CDSViews.POWorklist;
    //entity ItemView as projection on cds.CDSViews.ItemView;
    // entity ProductSet as projection on cds.CDSViews.ProductView;
    ///entity ProductSales as projection on cds.CDSViews.CProductValuesView;
}