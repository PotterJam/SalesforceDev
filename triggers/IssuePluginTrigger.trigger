trigger IssuePluginTrigger on Issue_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssuePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssuePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssuePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssuePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssuePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssuePluginHandler.handleAfterDelete(Trigger.old);
    }
}
