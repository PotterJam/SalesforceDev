trigger ProductServiceTrigger on Product_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductServiceHandler.handleAfterDelete(Trigger.old);
    }
}
