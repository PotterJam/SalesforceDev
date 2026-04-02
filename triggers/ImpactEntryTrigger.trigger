trigger ImpactEntryTrigger on Impact_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactEntryHandler.handleAfterDelete(Trigger.old);
    }
}
