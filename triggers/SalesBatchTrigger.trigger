trigger SalesBatchTrigger on Sales_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesBatchHandler.handleAfterDelete(Trigger.old);
    }
}
