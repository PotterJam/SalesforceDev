trigger ResourceFlowTrigger on Resource_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceFlowHandler.handleAfterDelete(Trigger.old);
    }
}
