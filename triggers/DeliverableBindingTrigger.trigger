trigger DeliverableBindingTrigger on Deliverable_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBindingHandler.handleAfterDelete(Trigger.old);
    }
}
