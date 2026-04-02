trigger SchedulePolicyTrigger on Schedule_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SchedulePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SchedulePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SchedulePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SchedulePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SchedulePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SchedulePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
