trigger ShiftLinkTrigger on Shift_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftLinkHandler.handleAfterDelete(Trigger.old);
    }
}
