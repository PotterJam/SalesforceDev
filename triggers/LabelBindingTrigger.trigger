trigger LabelBindingTrigger on Label_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBindingHandler.handleAfterDelete(Trigger.old);
    }
}
