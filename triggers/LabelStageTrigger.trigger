trigger LabelStageTrigger on Label_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelStageHandler.handleAfterDelete(Trigger.old);
    }
}
