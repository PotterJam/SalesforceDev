trigger PartnerFlowTrigger on Partner_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerFlowHandler.handleAfterDelete(Trigger.old);
    }
}
