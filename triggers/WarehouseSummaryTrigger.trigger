trigger WarehouseSummaryTrigger on Warehouse_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
