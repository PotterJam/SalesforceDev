trigger TagManagerTrigger on Tag_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagManagerHandler.handleAfterDelete(Trigger.old);
    }
}
