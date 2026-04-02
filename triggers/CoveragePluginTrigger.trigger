trigger CoveragePluginTrigger on Coverage_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoveragePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoveragePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoveragePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoveragePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoveragePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoveragePluginHandler.handleAfterDelete(Trigger.old);
    }
}
