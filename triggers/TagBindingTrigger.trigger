trigger TagBindingTrigger on Tag_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagBindingHandler.handleAfterDelete(Trigger.old);
    }
}
