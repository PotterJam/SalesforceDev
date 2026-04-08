trigger ReviewModelTrigger on Review_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewModelHandler.handleAfterDelete(Trigger.old);
    }
}
