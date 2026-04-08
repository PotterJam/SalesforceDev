trigger ShiftRuleTrigger on Shift_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftRuleHandler.handleAfterDelete(Trigger.old);
    }
}
