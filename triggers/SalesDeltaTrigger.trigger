trigger SalesDeltaTrigger on Sales_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
