trigger SalesFeedTrigger on Sales_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesFeedHandler.handleAfterDelete(Trigger.old);
    }
}
