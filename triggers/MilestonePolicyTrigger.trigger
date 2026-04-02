trigger MilestonePolicyTrigger on Milestone_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestonePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestonePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestonePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestonePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestonePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestonePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
