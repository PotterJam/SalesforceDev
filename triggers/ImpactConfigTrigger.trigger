trigger ImpactConfigTrigger on Impact_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactConfigHandler.handleAfterDelete(Trigger.old);
    }
}
