trigger LabelHubTrigger on Label_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelHubHandler.handleAfterDelete(Trigger.old);
    }
}
