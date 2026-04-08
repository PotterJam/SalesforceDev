trigger IndexStageTrigger on Index_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexStageHandler.handleAfterDelete(Trigger.old);
    }
}
