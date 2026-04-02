trigger LabelTriggerTrigger on Label_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
