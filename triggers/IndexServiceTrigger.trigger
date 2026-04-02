trigger IndexServiceTrigger on Index_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexServiceHandler.handleAfterDelete(Trigger.old);
    }
}
