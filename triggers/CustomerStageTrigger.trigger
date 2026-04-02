trigger CustomerStageTrigger on Customer_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerStageHandler.handleAfterDelete(Trigger.old);
    }
}
