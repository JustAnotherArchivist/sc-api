import logging


prefix = 'https://api.soundcloud.com/users?client_id=2t9loNQH90kzJcsFCODdigxfp325aq4z&app_version=1499947877&limit=200&ids='
prefixLength = len(prefix)
_logger = logging.getLogger('wpull.plugin.soundcloud-api-users')


def get_urls(filename, urlInfo, documentInfo):
	result = []
	if urlInfo['url'].startswith(prefix):
		idsCsv = urlInfo['url'][prefixLength:]
		ids = idsCsv.split(',')
		if len(ids) < 1:
			_logger.warn('‘{}’: no IDs found.'.format(urlInfo['url']))
			return []
		lastIdStr = ids[-1]
		if not lastIdStr.isdigit():
			_logger.warn('‘{}’: invalid last ID.'.format(urlInfo['url']))
		if lastIdStr == '0' or lastIdStr[-5:] == '00000':
			lastId = int(lastIdStr)
			for n in range(500):
				newFirstId = lastId + 1 + 200 * n
				newLastId = lastId + 200 * (n + 1)
				result.append({'url': prefix + ','.join([str(i) for i in range(newFirstId, newLastId + 1)])})
	return result


wpull_hook.callbacks.get_urls = get_urls
