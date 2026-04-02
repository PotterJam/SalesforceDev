trigger ShiftSettingTrigger on Shift_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftSettingHandler.handleAfterDelete(Trigger.old);
    }
}
