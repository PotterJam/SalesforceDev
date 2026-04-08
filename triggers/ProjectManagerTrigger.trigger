trigger ProjectManagerTrigger on Project_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectManagerHandler.handleAfterDelete(Trigger.old);
    }
}
