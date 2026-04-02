trigger LabelManagerTrigger on Label_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelManagerHandler.handleAfterDelete(Trigger.old);
    }
}
