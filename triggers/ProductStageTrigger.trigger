trigger ProductStageTrigger on Product_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductStageHandler.handleAfterDelete(Trigger.old);
    }
}
