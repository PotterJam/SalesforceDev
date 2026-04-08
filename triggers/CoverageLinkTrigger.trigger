trigger CoverageLinkTrigger on Coverage_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageLinkHandler.handleAfterDelete(Trigger.old);
    }
}
