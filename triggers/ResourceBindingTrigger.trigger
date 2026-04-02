trigger ResourceBindingTrigger on Resource_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceBindingHandler.handleAfterDelete(Trigger.old);
    }
}
