trigger LabelTaskTrigger on Label_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelTaskHandler.handleAfterDelete(Trigger.old);
    }
}
