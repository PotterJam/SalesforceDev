trigger BaselineConfigTrigger on Baseline_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineConfigHandler.handleAfterDelete(Trigger.old);
    }
}
