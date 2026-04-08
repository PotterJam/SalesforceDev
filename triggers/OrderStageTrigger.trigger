trigger OrderStageTrigger on Order_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderStageHandler.handleAfterDelete(Trigger.old);
    }
}
