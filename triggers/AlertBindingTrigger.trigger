trigger AlertBindingTrigger on Alert_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertBindingHandler.handleAfterDelete(Trigger.old);
    }
}
