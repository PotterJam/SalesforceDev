trigger DeliverableMappingTrigger on Deliverable_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableMappingHandler.handleAfterDelete(Trigger.old);
    }
}
