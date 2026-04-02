trigger SalesDetailTrigger on Sales_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesDetailHandler.handleAfterDelete(Trigger.old);
    }
}
