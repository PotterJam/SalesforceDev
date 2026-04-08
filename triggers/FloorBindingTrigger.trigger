trigger FloorBindingTrigger on Floor_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorBindingHandler.handleAfterDelete(Trigger.old);
    }
}
