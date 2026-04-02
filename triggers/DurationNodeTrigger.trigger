trigger DurationNodeTrigger on Duration_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationNodeHandler.handleAfterDelete(Trigger.old);
    }
}
