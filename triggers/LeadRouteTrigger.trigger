trigger LeadRouteTrigger on Lead_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRouteHandler.handleAfterDelete(Trigger.old);
    }
}
