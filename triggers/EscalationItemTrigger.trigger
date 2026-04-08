trigger EscalationItemTrigger on Escalation_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationItemHandler.handleAfterDelete(Trigger.old);
    }
}
