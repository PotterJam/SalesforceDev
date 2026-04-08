trigger PhaseItemTrigger on Phase_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseItemHandler.handleAfterDelete(Trigger.old);
    }
}
