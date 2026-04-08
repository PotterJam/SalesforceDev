trigger ShiftStageTrigger on Shift_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftStageHandler.handleAfterDelete(Trigger.old);
    }
}
