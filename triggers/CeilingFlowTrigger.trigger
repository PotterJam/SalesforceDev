trigger CeilingFlowTrigger on Ceiling_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingFlowHandler.handleAfterDelete(Trigger.old);
    }
}
