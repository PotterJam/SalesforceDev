trigger AlertFlowTrigger on Alert_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertFlowHandler.handleAfterDelete(Trigger.old);
    }
}
