sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'mycap2/app/purchaseorder/test/integration/FirstJourney',
		'mycap2/app/purchaseorder/test/integration/pages/POsList',
		'mycap2/app/purchaseorder/test/integration/pages/POsObjectPage',
		'mycap2/app/purchaseorder/test/integration/pages/PurchaseOrderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseOrderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('mycap2/app/purchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);