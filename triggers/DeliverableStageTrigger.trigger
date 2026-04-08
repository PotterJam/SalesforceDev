trigger DeliverableStageTrigger on Deliverable_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableStageHandler.handleAfterDelete(Trigger.old);
    }
}
